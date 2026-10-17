require 'media_info/stream'

module MediaInfo
  class GeneralStream < Stream
    TYPE = :general

    attr_reader :file_size,
                :file_size_string,
                :file_size_string1,
                :file_size_string2,
                :file_size_string3,
                :file_size_string4,
                :file_created_date,
                :file_created_date_local,
                :file_modified_date,
                :file_modified_date_local,
                :file_name,
                :file_extension,
                :complete_name,
                :complete_name_last,
                :file_name_last,
                :file_extension_last,
                :folder_name,
                :folder_name_last,
                :header_size,
                :data_size,
                :footer_size,
                :is_streamable

    private

    def file_size=(value)
      @file_size = value.to_i
    end

    def file_created_date=(value)
      @file_created_date = Time.parse(value)
    end

    def file_modified_date=(value)
      @file_modified_date = Time.parse(value)
    end

    def header_size=(value)
      @header_size = value.to_i
    end

    def data_size=(value)
      @data_size = value.to_i
    end

    def footer_size=(value)
      @footer_size = value.to_i
    end
  end
end
