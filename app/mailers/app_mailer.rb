class AppMailer < ActionMailer::Base
	default from: "no-reply@seemyresu.me"

	def welcome_email(tmpuser)
    	@tmpuser = tmpuser
    	mail(to: @tmpuser.email, subject: "Thank you for signing up")
	end

	def feedback(feedback)
    	mail(to: "sagarbhosale019@gmail.com", subject: "Feedback", :body => feedback.who + ": " + feedback.description)
	end

end
