module Imasei

  module Estruturas

    class RetornoTipoProcedimento < ::Valuable

      has_value :id_tipo_procedimento
      has_value :nome

      def initialize(params)
        self.id_tipo_procedimento = params[:id_tipo_procedimento]
        self.nome = params[:nome]
        
        initialize_attributes
      end
    end

  end

end