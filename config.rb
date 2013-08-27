# Require any additional compass plugins here.
require 'json'
require 'breakpoint-slicer'
require 'singularitygs'

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "stylesheets"
sass_dir = "sass"
images_dir = "images"
javascripts_dir = "javascripts"

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false

preferred_syntax = :sass

sass_options = { :custom => {'breakpoint_file' => 'breakpoints.json'} }

# This creates a SASS function debug() that returns $debug into SASS
module Sass::Script::Functions
  def breakpoints
  
    # Reading an array of breakpoints into a file
    unless breakpoints_array_raw = JSON.load( IO.read( options[:custom]['breakpoint_file'] ))
      raise Sass::SyntaxError.new("Error: Breakpoints file '#{options[:custom]['breakpoint_file']}' does not exist.")
    end
    
    # Converting strings in the array to SASS String literals
    breakpoints_array_sassy = breakpoints_array_raw.map { |s| Sass::Script::String.new(s) }
  
    # Returning the list into SASS
    Sass::Script::List.new( breakpoints_array_sassy, :space )
  end
end