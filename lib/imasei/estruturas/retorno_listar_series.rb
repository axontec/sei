module Imasei

  module Estruturas

    class RetornoListarSeries < ::Valuable

      has_collection :retorno_listar_series, klass: RetornoSerie

      def initialize(params)        
        self.retorno_listar_series = []          
          item = params[:item]
          if item.is_a?(Hash)
            self.retorno_listar_series << Imasei::Estruturas::RetornoSerie.new(item)
          elsif item.is_a?(Array)
            item.each do |retorno_listar_series|
              self.retorno_listar_series << Imasei::Estruturas::RetornoSerie.new(retorno_listar_series)
            end
          end        
        initialize_attributes
      end

    end

  end

end