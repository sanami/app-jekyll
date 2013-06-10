require_relative  './bundler'
# puts 'jekyll_asset_pipeline.rb'
# require 'jekyll_asset_pipeline'

module JekyllAssetPipeline
  class CoffeeScriptConverter < JekyllAssetPipeline::Converter
    def self.filetype
      '.coffee'
    end

    def convert
      return CoffeeScript.compile(@content)
    end
  end

  class JavaScriptCompressor < JekyllAssetPipeline::Compressor
    def self.filetype
      '.js'
    end

    def compress
      return Uglifier.compile(@content)
    end
  end

 class CssCompressor < JekyllAssetPipeline::Compressor
    def self.filetype
      '.css'
    end

    def compress
      return CSSminify.compress(@content)
    end
  end
end
