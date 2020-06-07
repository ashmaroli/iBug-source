# frozen_string_literal: true

require "jekyll"
require "memory_profiler"

report = MemoryProfiler.report do
  start_time = Time.now
  Jekyll::Commands::Build.process({
    "source"      => File.expand_path("..", __dir__),
    "destination" => File.expand_path("../_site", __dir__),
  })
  end_time = Time.now
end

Jekyll.logger.info "", "done in #{(end_time - start_time).round(3)} seconds."
Jekyll.logger.info ""

if ENV["CI"]
  report.pretty_print(scale_bytes: true, color_output: false, normalize_paths: true)
else
  FileUtils.mkdir_p(".tmp")
  basename = ARGV[0] || ".memprof"
  report_file = File.join(".tmp", basename + ".txt")

  total_allocated_output = report.scale_bytes(report.total_allocated_memsize)
  total_retained_output  = report.scale_bytes(report.total_retained_memsize)

  Jekyll.logger.info "Total allocated: #{total_allocated_output} (#{report.total_allocated} objects)".cyan
  Jekyll.logger.info "Total retained:  #{total_retained_output} (#{report.total_retained} objects)".cyan

  report.pretty_print(to_file: report_file, scale_bytes: true, normalize_paths: true)
  Jekyll.logger.info "\nDetailed Report saved into:", report_file.cyan
end
