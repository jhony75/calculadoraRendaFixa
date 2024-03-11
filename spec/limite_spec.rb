# frozen_string_literal: true

require_relative "../lib/limite"

# RSpec.describe LHopitalCalculator::LimitCalculator do
#   let(:calculator) { described_class.new }

#   let(:function_f) { ->(x) { x**2 + 1 } }
#   let(:function_f) { ->(x) { x - 1 } }

#   describe "#calculate_limit" do
#     context "when both functions are defined" do
#       it "calculates the limit using L'Hôpital's rule" do
#         result = calculator.calculate_limit(:function_f, :function_g, 2)
#         expect(result).to eq("Limit at x = 2 is 5.0")
#       end
#     end

#     context "when one or both functions are not defined" do
#       it "returns an error message" do
#         result = calculator.calculate_limit(nil, :function_g, 2)
#         expect(result).to eq("Both functions must be defined")
#       end
#     end
#   end
# end

RSpec.describe LHopitalCalculator::LimitCalculator do
  # Create an instance of the LimitCalculator for testing
  let(:calculator) { described_class.new }

  # Define functions for testing
  let(:function_f) { ->(x) { x**2 + 1 } }
  let(:function_g) { ->(x) { x - 1 } }

  # Test the calculate_limit method
  describe "#calculate_limit" do
    context "when both functions are defined" do
      it "calculates the limit using L'Hôpital's rule" do
        result = calculator.calculate_limit(function_f, function_g, 2)
        expect(result).to eq("Limit at point = 2 is 5.0")
      end
    end

    context "when one or both functions are not defined" do
      it "returns an error message" do
        result = calculator.calculate_limit(nil, function_g, 2)
        expect(result).to eq("Both functions must be defined")
      end
    end
  end
end
