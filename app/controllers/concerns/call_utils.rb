module CallUtils
  extend ActiveSupport::Concern

  def twiml_dial(phone_number, url_action)
    response = Twilio::TwiML::VoiceResponse.new

    response.dial(number: phone_number, action: url_action, method: "POST")

    render xml: response.to_s
  end

  def twiml_record(url_action)
    response = Twilio::TwiML::VoiceResponse.new

    response.say(message: "Deixe um recado após o sinal! Pressione asterisco para encerrar o recado!", language: "pt-BR", voice: "Polly.Ricardo")

    response.record(action: url_action, recordingStatusCallback: callback_calls_path, method: "POST", max_length: 30, finish_on_key: "*")

    render xml: response.to_s
  end

  def extract_params(params, prefix)
    params.transform_keys { | k | k.sub(prefix, "").downcase }
  end
end
