require 'date'
require 'base64'
require 'savon'
require 'valuable'
require 'gem_config'

require 'wssei/connection'
require 'wssei/printer'
require 'wssei/servico'
require 'wssei/version'

require 'wssei/estruturas/documento'
require 'wssei/estruturas/procedimento'
require 'wssei/estruturas/retorno_inclusao_documento'
require 'wssei/estruturas/retorno_geracao_procedimento'
require 'wssei/estruturas/retorno_unidade'
require 'wssei/estruturas/retorno_list_unidades'
require 'wssei/estruturas/retorno_geracao_bloco'
require 'wssei/estruturas/retorno_inclusao_documento_bloco'
require 'wssei/estruturas/retorno_inclusao_processo_bloco'
require 'wssei/estruturas/retorno_conclusao_processo'
require 'wssei/estruturas/retorno_boolean'
require 'wssei/estruturas/retorno_usuario'
require 'wssei/estruturas/retorno_list_usuarios'
require 'wssei/estruturas/retorno_consultar_procedimento'

module Sei

  include GemConfig::Base

  with_configuration do
    has :wsdl, classes: String
    has :follow_redirects
    has :pretty_print_xml
    has :sigla, classes: String
    has :identificacao, classes: String
  end
  
end