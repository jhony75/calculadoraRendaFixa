# frozen_string_literal: true
require_relative '../lib/calculadora_renda_fixa'

RSpec.describe calculadora_renda_fixa do
  it "has a version number" do
    expect(calculadora_renda_fixa::VERSION).not_to be nil
  end
end
