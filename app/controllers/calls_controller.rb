class CallsController < ApplicationController
  skip_before_action :verify_authenticity_token
  include CallUtils

  def index
    @calls = Call.all
  end

  def welcome
    response = Twilio::TwiML::VoiceResponse.new

    message = "Obrigado por ligar para a Company Dev. Por favor, pressione o número um para ser encaminhado para a nossa atendente. Pressione dois para deixar um recado."

    response.gather(num_digits: 1, action: menu_calls_path, method: "GET") do |gather|
      gather.say(
          message: message,
          loop: 2,
          language: "pt-BR",
          voice: "Polly.Ricardo"
        )
    end
    render xml: response.to_s
  end

  def menu
    chosen_number = params[:Digits]

    case chosen_number
    when "1"
      twiml_dial(phone_number, calls_path)
    when "2"
      twiml_record(calls_path)
    end
  end

  def create
    @call = Call.new

    @call.set_attributes(call_params)

    if @call.save
      Turbo::StreamsChannel.broadcast_append_to "calls", target: "calls_content", partial: "calls/table_content", locals: { call: @call }
      head :created
    end
  end

  def callback
    @call = Call.find(params[:CallSid])

    @call.status = params[:RecordingStatus]

    if @call.save
      Turbo::StreamsChannel.broadcast_replace_to "calls", target: "call_#{@call.id}", partial: "calls/table_content", locals: { call: @call }
      head :ok
    end
  end

  private

  def call_params
    if params[:DialCallSid]
      extract_params(params.permit(:DialCallSid, :DialCallStatus, :DialCallDuration), "DialCall")
    else
      extract_params(params.permit(:CallSid, :RecordingStatus, :RecordingDuration, :RecordingUrl), "Recording")
    end
  end
end
