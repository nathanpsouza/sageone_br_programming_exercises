module Importer::Parser
  class InvalidImportFile < StandardError
    attr_reader :reason
    def initialize(reason)
      @reason = reason
    end
  end
end