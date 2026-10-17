require 'test_helper'

describe MediaInfo do
  it 'parse file' do
    info_file = MediaInfo.parse('test/fixtures/image.jpg')

    assert(info_file.image?)
  end
end

describe MediaInfo::VideoStream do
  it 'keeps a fractional frame rate and stores tagged date separately' do
    stream = MediaInfo::VideoStream.new(
      frame_rate: '23.976',
      frame_rate_minimum: '23.976',
      frame_rate_nominal: '24.000',
      frame_rate_maximum: '30',
      encoded_date: 'UTC 2019-01-01 00:00:00',
      tagged_date: 'UTC 2020-06-15 12:30:00'
    )

    assert_in_delta(23.976, stream.frame_rate)
    assert_in_delta(23.976, stream.frame_rate_minimum)
    assert_equal(24, stream.frame_rate_nominal)
    assert_equal(30, stream.frame_rate_maximum)
    assert_equal(Time.parse('UTC 2019-01-01 00:00:00'), stream.encoded_date)
    assert_equal(Time.parse('UTC 2020-06-15 12:30:00'), stream.tagged_date)
  end

  it 'exposes the exact frame rate fraction' do
    stream = MediaInfo::VideoStream.new(frame_rate_num: '24000', frame_rate_den: '1001')

    assert_equal(24_000, stream.frame_rate_num)
    assert_equal(1001, stream.frame_rate_den)
  end

  it 'exposes the colour description shared by video formats' do
    stream = MediaInfo::VideoStream.new(
      colour_description_present: 'Yes',
      colour_primaries: 'BT.709',
      transfer_characteristics: 'BT.709',
      matrix_coefficients: 'BT.709',
      colour_range: 'Limited'
    )

    assert_equal('Yes', stream.colour_description_present)
    assert_equal('BT.709', stream.colour_primaries)
    assert_equal('BT.709', stream.transfer_characteristics)
    assert_equal('BT.709', stream.matrix_coefficients)
    assert_equal('Limited', stream.colour_range)
  end
end

describe MediaInfo::ImageStream do
  it 'exposes colour description metadata, like video streams already do' do
    stream = MediaInfo::ImageStream.new(
      colour_description_present: 'Yes',
      colour_primaries: 'BT.709',
      transfer_characteristics: 'sRGB/sYCC',
      matrix_coefficients: 'Identity',
      colour_range: 'Full'
    )

    assert_equal('Yes', stream.colour_description_present)
    assert_equal('BT.709', stream.colour_primaries)
    assert_equal('sRGB/sYCC', stream.transfer_characteristics)
    assert_equal('Identity', stream.matrix_coefficients)
    assert_equal('Full', stream.colour_range)
  end
end

describe MediaInfo::Parser do
  it 'keeps consecutive uppercase letters (acronyms) together' do
    convert = ->(name) { MediaInfo::Parser.allocate.send(:convert_element_name, name) }

    assert_equal('hdr_format', convert.call('HDR_Format'))
    assert_equal('hdr_format_profile', convert.call('HDR_Format_Profile'))
    assert_equal('max_cll', convert.call('MaxCLL'))
    assert_equal('max_fall', convert.call('MaxFALL'))
    assert_equal('id', convert.call('ID'))
    assert_equal('format_settings_cabac', convert.call('Format_Settings_CABAC'))
    assert_equal('format_settings_gmc', convert.call('Format_Settings_GMC'))
    assert_equal('format_settings_gop', convert.call('Format_Settings_GOP'))
    # must NOT be split into format_settings_q_pel - this one already worked
    # correctly before the fix and must keep working
    assert_equal('format_settings_qpel', convert.call('Format_Settings_QPel'))
    assert_equal('image_format_with_hint_list', convert.call('Image_Format_WithHint_List'))
  end
end

describe MediaInfo::AudioStream do
  it 'stores tagged date separately from encoded date' do
    stream = MediaInfo::AudioStream.new(
      encoded_date: 'UTC 2019-01-01 00:00:00',
      tagged_date: 'UTC 2020-06-15 12:30:00'
    )

    assert_equal(Time.parse('UTC 2019-01-01 00:00:00'), stream.encoded_date)
    assert_equal(Time.parse('UTC 2020-06-15 12:30:00'), stream.tagged_date)
  end

  it 'exposes the track language, like video and menu streams already do' do
    stream = MediaInfo::AudioStream.new(language: 'en', language_string: 'English')

    assert_equal('en', stream.language)
    assert_equal('English', stream.language_string)
  end
end

describe MediaInfo::GeneralStream do
  it 'reads created and modified dates from their own fields' do
    stream = MediaInfo::GeneralStream.new(
      file_created_date: 'UTC 2016-01-01 00:00:00',
      file_modified_date: 'UTC 2017-01-07 14:53:37'
    )

    assert_equal(Time.parse('UTC 2016-01-01 00:00:00'), stream.file_created_date)
    assert_equal(Time.parse('UTC 2017-01-07 14:53:37'), stream.file_modified_date)
  end
end
