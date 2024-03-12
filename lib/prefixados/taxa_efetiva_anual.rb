# frozen_string_literal: true

module TaxaEfetivaAnual
  # Calcula taxa efetiva anual de diferentes maneiras
  class TaxaEfetivaAnual
    # Prefixado - Cálculo da Taxa Efetiva Anual a partir do PU.
    # Taxa = ([VN/PU]^252/du - 1) * 100
    # Taxa = ([Valor Nominal do Título/Preço Unitário do Título]^252/dias uteis - 1) * 100
    def initialize(valor_nominal, preco_unitario, dias_uteis)
      @valor_nominal = valor_nominal.to_f
      @preco_unitario = preco_unitario.to_f
      @dias_uteis = dias_uteis.to_f
    end

    def calcular_taxa_efetiva_anual_por_preco_unitario
      valor_sobre_preco = @valor_nominal / @preco_unitario
      # puts "Valor Sobre Preço => #{@valor_nominal} / #{@preco_unitario} = #{valor_sobre_preco}"

      calculo_dias_uteis = 252 / @dias_uteis
      # puts "252 / dias uteis => 252 / #{@dias_uteis} = #{calculo_dias_uteis}"

      valor_elevado_dias = valor_sobre_preco**calculo_dias_uteis
      # puts "Valor elevado a dias uteis => #{valor_sobre_preco} ^ #{calculo_dias_uteis} = #{valor_elevado_dias}"

      valor_elevado_dias_menos_um = valor_elevado_dias - 1
      # puts "Valor - 1 => #{valor_elevado_dias} - 1 = #{valor_elevado_dias_menos_um}"

      taxa = valor_elevado_dias_menos_um * 100
      # puts "Valor * 100 => #{valor_elevado_dias_menos_um} * 100 = #{taxa.round(2)}"
      taxa.round(2)
    end
  end
end

# taxa_calculator = TaxaEfetivaAnual::TaxaEfetivaAnual.new(1000, 883, 252)
# tax = TaxaEfetivaAnual::TaxaEfetivaAnual.new(1000, 800, 500)

# taxa_calculator.calcular_taxa_efetiva_anual_por_preco_unitario
# tax.calcular_taxa_efetiva_anual_por_preco_unitario
