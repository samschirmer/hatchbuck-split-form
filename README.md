Referral form -- takes information from a referrer, then a bunch of referrals. Each array element is submitted to one Hatchbuck form while the referrer's information is submitted to a differnt one. 

Runs inside a Sinatra app; requires HTTParty and those 0.25 second sleeps between submissions or the form server shits itself. No idea what HTTP/NET was doing differently, but HTTParty solved the issue. 

Sleep times could possibly be reduced, but this is fine for our purposes. 
