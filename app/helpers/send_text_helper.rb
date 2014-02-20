
module SendTextHelper
	def send_text_message

		number_to_send_to = params[:number_to_send_to]

		twilio_sid = "ACce2ac884ee78da5155fc87f7bbc0cb4a"
		twilio_token = "40f5a6b6a24f8cae7760b7151563a18a"
		twilio_phone_number = "6087136449"

		@twilio_client = Twilio::Twilio::REST::Client.new twilio_sid, twilio_token

		@twilio_client.account.sms.messages.create(
			:from => "+1#{twilio_phone_number}",
			:to => number_to_send_to,
			:body => "Ayyyyyiyiyiyi! Look who's gotten Twilio working! Zebras parading... #{number_to_send_to}"
		)
	end
end
