# frozen_string_literal: true

require_relative "../lib/prefixados/taxa_efetiva_anual"

RSpec.describe TaxaEfetivaAnual::TaxaEfetivaAnual do
  describe "#calcular_taxa_efetiva_anual_por_preco_unitario" do
    context "when given valid input values" do
      it "calculates the correct effective annual rate" do
        calculator = TaxaEfetivaAnual::TaxaEfetivaAnual.new(1000, 883, 252)
        expect(calculator.calcular_taxa_efetiva_anual_por_preco_unitario).to eq(13.25)
      end
    end
  end
end
