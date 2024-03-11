# frozen_string_literal: true

require_relative "./version"

# Create a module for your project
module LHopitalCalculator
  # Define a class for limit calculations
  class LimitCalculator
    def initialize
      # You can initialize any necessary variables here
    end

    # Define a method to calculate limits using L'Hôpital's rule
    def calculate_limit(function_f, function_g, point)
      # Check if the functions are defined and not nil
      return "Both functions must be defined" unless function_f && function_g

      # Calculate the limit using L'Hôpital's rule
      numerator = function_f.call(point + 1) - function_f.call(point)
      denominator = function_g.call(point + 1) - function_g.call(point)

      # Check for indeterminate form (0/0) and apply L'Hôpital's rule
      if numerator.zero? && denominator.zero?
        calculate_limit_derivative(function_f, function_g, point)
      else
        # Return the result if not in indeterminate form
        result = numerator / denominator.to_f
        "Limit at point = #{point} is #{result}"
      end
    end

    private

    # Define a method to calculate the derivative of the functions
    def calculate_limit_derivative(function_f, function_g, point)
      # Calculate the derivatives using numerical differentiation
      derivative_f = (function_f.call(point + 1) - function_f.call(point)) / 1.0
      derivative_g = (function_g.call(point + 1) - function_g.call(point)) / 1.0

      # Check for indeterminate form (0/0) in derivatives
      if derivative_f.zero? && derivative_g.zero?
        "Unable to determine the limit using L'Hôpital's rule"
      else
        # Calculate the limit using L'Hôpital's rule with derivatives
        result = derivative_f / derivative_g.to_f
        "Limit at point=#{point} using L'Hôpital's rule is #{result}"
      end
    end
  end
end

# Example usage
if __FILE__ == $0
  # Define your functions for f(point) and g(point)
  function_f = ->(point) { point**2 + 1 }
  function_g = ->(point) { point - 1 }

  # Create an instance of the LimitCalculator
  calculator = LHopitalCalculator::LimitCalculator.new

  # Calculate the limit at a specific point (e.g., point = 2)
  result = calculator.calculate_limit(function_f, function_g, 2)

  # Print the result
  puts result
end
