get '/' do
	erb :index
end

post '/submit' do 
	uri = URI('https://app.hatchbuck.com/onlineForm/submit.php')
	referrer_form_id = 82122818622
	referral_form_id = 82123150665

	@referrals = Array.new
	params['r'].each do |r|
		res = HTTParty.post( 
			'https://app.hatchbuck.com/onlineForm/submit.php',
			query: {
				'q1_firstName1' => r['first_name'], 
				'q3_control_lname' => r['last_name'],
				'q4_email' => r['email'],
				'q6_control_company' => r['company'],
				'formID' => "#{referral_form_id}",
				'simple_spc' => "#{referral_form_id}-#{referral_form_id}",
				'enableServerValidation' => 1,
				'enable303Redirect' => 1,
				'website' => ''
			}
		)
		sleep 0.25
	end

	sleep 0.25
	res = HTTParty.post( 
		'https://app.hatchbuck.com/onlineForm/submit.php',
		query: {
			'q1_firstName1' => params['referrer_first_name'], 
			'q3_control_lname' => params['referrer_last_name'],
			'q4_email' => params['referrer_email'],
			'q6_control_company' => params['referrer_company'],
			'formID' => "#{referrer_form_id}",
			'simple_spc' => "#{referrer_form_id}-#{referrer_form_id}",
			'enableServerValidation' => 1,
			'enable303Redirect' => 1,
			'website' => ''
		}
	)

	redirect 'https://www.hatchbuck.com/lp/thank-you-customer-referral/'
end
