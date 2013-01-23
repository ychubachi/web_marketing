require 'spec_helper'

describe RSpec::Expectations, "#fail_with with diff" do
  let(:differ) { double("differ") }

  before(:each) do
    RSpec::Expectations.stub(:differ) { differ }
  end

  it "calls differ if expected/actual are not strings (or numbers or procs)" do
    differ.should_receive(:diff_as_object).and_return("diff")
    expect {
      RSpec::Expectations.fail_with "the message", Object.new, Object.new
    }.to fail_with("the message\nDiff:diff")
  end

  context "with two strings" do
    context "and actual is multiline" do
      it "calls differ" do
        differ.should_receive(:diff_as_string).and_return("diff")
        expect {
          RSpec::Expectations.fail_with "the message", "expected\nthis", "actual"
        }.to fail_with("the message\nDiff:diff")
      end
    end

    context "and expected is multiline" do
      it "calls differ" do
        differ.should_receive(:diff_as_string).and_return("diff")
        expect {
          RSpec::Expectations.fail_with "the message", "expected", "actual\nthat"
        }.to fail_with("the message\nDiff:diff")
      end
    end

    context "and both are single line strings" do
      it "does not call differ" do
        differ.should_not_receive(:diff_as_string)
        expect {
          RSpec::Expectations.fail_with("the message", "expected", "actual")
        }.to fail_with("the message")
      end
    end
  end

  it "does not call differ if no expected/actual" do
    expect {
      RSpec::Expectations.fail_with "the message"
    }.to fail_with("the message")
  end

  it "does not call differ expected is Numeric" do
    expect {
      RSpec::Expectations.fail_with "the message", 1, "1"
    }.to fail_with("the message")
  end

  it "does not call differ when actual is Numeric" do
    expect {
      RSpec::Expectations.fail_with "the message", "1", 1
    }.to fail_with("the message")
  end

  it "does not call differ if expected or actual are procs" do
    expect {
      RSpec::Expectations.fail_with "the message", lambda {}, lambda {}
    }.to fail_with("the message")
  end
end
