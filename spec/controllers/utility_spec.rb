# -*- coding: utf-8 -*-
require "spec_helper"

class DummyUtility
  include Utility
end

describe Utility do
  before(:each) do
    @dummy_utility = DummyUtility.new
  end
  
  it 'dummy_utility' do
    cookies[:web_marketing_uuid] = {
      value: 'dummy_uuid',
      expires: 365.days.from_now }
    uuid = @dummy_utility.read_or_create_uuid(cookies)
    p uuid
  end

end
