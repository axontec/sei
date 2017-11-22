module Imasei

  module Estruturas

    class RetornoSerie < ::Valuable

      has_value :id_serie
      has_value :nome
      has_value :aplicabilidade

      def initialize(params)
        self.id_serie = params[:id_serie]
        self.nome = params[:nome]
        self.aplicabilidade = params[:aplicabilidade]
        
        initialize_attributes
      end
    end

  end

end