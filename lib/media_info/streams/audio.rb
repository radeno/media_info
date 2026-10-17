require 'media_info/stream'

module MediaInfo
  class AudioStream < Stream
    TYPE = :audio

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
                :channel_s,
                :channel_s_string,
                :channel_positions,
                :channel_positions_string2,
                :channel_layout,
                :channel_layout_id,
                :resolution,
                :resolution_string,
                :sampling_rate,
                :sampling_rate_string,
                :frame_count,
                :compression_mode,
                :compression_mode_string,
                :language,
                :language_string,
                :language_string1,
                :language_string2,
                :language_string3,
                :language_string4,
                :language_more,
                :encoded_date,
                :tagged_date

    alias channels channel_s
    alias channels_string channel_s_string

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

    def channel_s=(value)
      @channel_s = value.to_i
    end

    def resolution=(value)
      @resolution = value.to_i
    end

    def sampling_rate=(value)
      @sampling_rate = value.to_i
    end

    def frame_count=(value)
      @frame_count = value.to_i
    end

    def encoded_date=(value)
      @encoded_date = Time.parse(value)
    end

    def tagged_date=(value)
      @tagged_date = Time.parse(value)
    end
  end
end
