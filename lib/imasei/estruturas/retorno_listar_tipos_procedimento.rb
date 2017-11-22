module Imasei

  module Estruturas

    class RetornoListarTiposProcedimento < ::Valuable

      has_collection :retorno_listar_tipos_procedimento, klass: RetornoTipoProcedimento

      def initialize(params)
        self.retorno_listar_tipos_procedimento = []
          item = params[:item]
          if item.is_a?(Hash)
            self.retorno_listar_tipos_procedimento << Imasei::Estruturas::RetornoTipoProcedimento.new(item)
          elsif item.is_a?(Array)
            item.each do |retorno_listar_tipos_procedimento|
              self.retorno_listar_tipos_procedimento << Imasei::Estruturas::RetornoTipoProcedimento.new(retorno_listar_tipos_procedimento)
            end
          end        
        initialize_attributes
      end

    end

  end

end