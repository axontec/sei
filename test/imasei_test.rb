require 'test_helper'
require 'net/http'
describe 'imasei' do

  before do
    Imasei.configure do |config|
      #config.wsdl = "https://sei-treinamento.campinas.sp.gov.br/sei/controlador_ws.php?servico=sei"
      config.wsdl = "https://sei.campinas.sp.gov.br/sei/controlador_ws.php?servico=sei"
      config.follow_redirects = false
      config.pretty_print_xml = true
      config.sigla = 'SINGAJ'
      config.identificacao = 'SGJ'
    end

  end

 it 'Consulta um Procedimento' do
            idUnidade = '110001176'
            protocoloProcedimento = 'PMC.2017.00000236-75' 
            sinRetornarAssuntos = "N" 
            sinRetornarInteressados = "N" 
            sinRetornarObservacoes = "N" 
            sinRetornarAndamentoGeracao = "N" 
            sinRetornarAndamentoConclusao = "N" 
            retorno_consultar_procedimento = 
            Imasei::Servico.consultar_procedimento(idUnidade,protocoloProcedimento,sinRetornarAssuntos,sinRetornarInteressados,sinRetornarObservacoes,sinRetornarAndamentoGeracao,sinRetornarAndamentoConclusao)
    refute_nil retorno_consultar_procedimento
  end
end
