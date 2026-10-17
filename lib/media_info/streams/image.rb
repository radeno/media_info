require 'media_info/stream'

module MediaInfo
  class ImageStream < Stream
    TYPE = :image

    attr_reader :width,
                :width_string,
                :height,
                :height_string,
                :color_space,
                :chroma_subsampling,
                :bit_depth,
                :bit_depth_string,
                :resolution,
                :resolution_string,
                :compression_mode,
                :compression_mode_string,
                :colour_description_present,
                :colour_primaries,
                :transfer_characteristics,
                :matrix_coefficients,
                :colour_range

    private

    def width=(value)
      @width = value.to_i
    end

    def height=(value)
      @height = value.to_i
    end

    def bit_depth=(value)
      @bit_depth = value.to_i
    end

    def resolution=(value)
      @resolution = value.to_i
    end
  end
end
