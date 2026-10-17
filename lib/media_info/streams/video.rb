require 'media_info/stream'

module MediaInfo
  class VideoStream < Stream
    TYPE = :video

    attr_reader :duration,
                :duration_string,
                :duration_string1,
                :duration_string2,
                :duration_string3,
                :duration_string4,
                :duration_string5,
                :bit_rate,
                :bit_rate_string,
                :bit_rate_mode,
                :bit_rate_mode_string,
                :bit_rate_minimum,
                :bit_rate_minimum_string,
                :bit_rate_nominal,
                :bit_rate_nominal_string,
                :bit_rate_maximum,
                :bit_rate_maximum_string,
                :bit_rate_encoded,
                :bit_rate_encoded_string,
                :width,
                :width_string,
                :height,
                :height_string,
                :pixel_aspect_ratio,
                :pixel_aspect_ratio_string,
                :resolution,
                :resolution_string,
                :display_aspect_ratio,
                :display_aspect_ratio_string,
                :rotation,
                :rotation_string,
                :frame_rate_mode,
                :frame_rate_mode_string,
                :frame_rate,
                :frame_rate_string,
                :frame_rate_minimum,
                :frame_rate_minimum_string,
                :frame_rate_nominal,
                :frame_rate_nominal_string,
                :frame_rate_maximum,
                :frame_rate_maximum_string,
                :frame_count,
                :standard,
                :color_space,
                :colorimetry,
                :chroma_subsampling,
                :bit_depth,
                :bit_depth_string,
                :colour_description_present,
                :colour_primaries,
                :transfer_characteristics,
                :matrix_coefficients,
                :colour_range,
                :frame_rate_num,
                :frame_rate_den,
                :scan_type,
                :scan_type_string,
                :scan_order,
                :scan_order_string,
                :compression_mode,
                :compression_mode_string,
                :compression_ratio,
                :bits_pixel_frame, # "Bits-(Pixel*Frame)"
                :format_settings_bvop,
                :format_settings_bvop_string,
                :format_settings_qpel,
                :format_settings_qpel_string,
                :format_settings_gmc,
                :format_settings_gmc_string,
                :format_settings_matrix,
                :format_settings_matrix_string,
                :format_settings_cabac,
                :format_settings_cabac_string,
                :format_settings_ref_frames,
                :format_settings_ref_frames_string,
                :format_settings_pulldown,
                :format_settings_pulldown_string,
                :format_settings_frame_mode,
                :format_settings_frame_mode_string,
                :format_settings_gop,
                :format_settings_gop_string,
                :format_settings_wrapping,
                :language,
                :language_string,
                :language_string1,
                :language_string2,
                :language_string3,
                :language_string4,
                :language_more,
                :encoded_date,
                :tagged_date

    def duration_seconds
      duration / 1000.0
    end

    private

    def duration=(value)
      @duration = value.to_i
    end

    def bit_rate=(value)
      @bit_rate = value.to_i
    end

    def bit_rate_minimum=(value)
      @bit_rate_minimum = value.to_i
    end

    def bit_rate_nominal=(value)
      @bit_rate_nominal = value.to_i
    end

    def bit_rate_maximum=(value)
      @bit_rate_maximum = value.to_i
    end

    def width=(value)
      @width = value.to_i
    end

    def height=(value)
      @height = value.to_i
    end

    def frame_rate=(value)
      @frame_rate = parse_frame_rate(value)
    end

    def frame_rate_minimum=(value)
      @frame_rate_minimum = parse_frame_rate(value)
    end

    def frame_rate_nominal=(value)
      @frame_rate_nominal = parse_frame_rate(value)
    end

    def frame_rate_maximum=(value)
      @frame_rate_maximum = parse_frame_rate(value)
    end

    def bit_depth=(value)
      @bit_depth = value.to_i
    end

    def resolution=(value)
      @resolution = value.to_i
    end

    def frame_rate_num=(value)
      @frame_rate_num = value.to_i
    end

    def frame_rate_den=(value)
      @frame_rate_den = value.to_i
    end

    def encoded_date=(value)
      @encoded_date = Time.parse(value)
    end

    def tagged_date=(value)
      @tagged_date = Time.parse(value)
    end

    def parse_frame_rate(value)
      number = Float(value)
      (number % 1).zero? ? number.to_i : number
    end
  end
end
