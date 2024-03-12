# frozen_string_literal: true

require "date"

module TaxaEfetivaAnual
  # Calcula taxa efetiva anual de diferentes maneiras
  class TaxaEfetivaAnual
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

  # Calcula o preço unitário de um título, dado Valor Nominal, Taxa e Dias Uteis
  class PrecoUnitario
    def calcular_pu(valor_nominal, taxa, dias_uteis)
      fator_desconto = (taxa / 100.0 + 1.0)**(dias_uteis.to_f / 252.0)
      pu = valor_nominal / fator_desconto
      pu.round(2)
    end
  end
end

calculadora = TaxaEfetivaAnual::PrecoUnitario.new

puts calculadora.calcular_pu(1000.0, 15.0, 440.0)
