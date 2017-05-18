require 'date'
require 'base64'
require 'savon'
require 'valuable'
require 'gem_config'

require 'imasei/connection'
require 'imasei/printer'
require 'imasei/servico'
require 'imasei/version'

require 'imasei/estruturas/documento'
require 'imasei/estruturas/procedimento'
require 'imasei/estruturas/retorno_inclusao_documento'
require 'imasei/estruturas/retorno_geracao_procedimento'
require 'imasei/estruturas/retorno_unidade'
require 'imasei/estruturas/retorno_list_unidades'
require 'imasei/estruturas/retorno_geracao_bloco'
require 'imasei/estruturas/retorno_inclusao_documento_bloco'
require 'imasei/estruturas/retorno_inclusao_processo_bloco'
require 'imasei/estruturas/retorno_conclusao_processo'
require 'imasei/estruturas/retorno_boolean'
require 'imasei/estruturas/retorno_usuario'
require 'imasei/estruturas/retorno_list_usuarios'
require 'imasei/estruturas/retorno_unidades_procedimento_aberto'
require 'imasei/estruturas/retorno_tipo_procedimento'
require 'imasei/estruturas/retorno_consultar_procedimento'

module Imasei

  include GemConfig::Base

  with_configuration do
    has :wsdl, classes: String
    has :follow_redirects
    has :pretty_print_xml
    has :sigla, classes: String
    has :identificacao, classes: String
  end
  
end