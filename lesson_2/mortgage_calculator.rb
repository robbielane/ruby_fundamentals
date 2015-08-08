def prompt(msg)
  puts "=> #{msg}"
end

intro = <<-MSG

          *****************************************
          *  Welcome to the Mortgage Calculator   *
          *****************************************


MSG

prompt intro
prompt "Enter a loan amount in USD($)"

loan_amount = ''
loop do
  loan_amount = gets.chomp
  if loan_amount.empty? ||  loan_amount.to_f < 0
    prompt "Please enter a positive number (eg. 50000)"
  else
    break
  end
end

prompt "Enter the Annual Percentage Rate (APR)"
prompt "*** example for 5% enter '5' or for 2.5% enter '2.5'"

apr = ''
loop do
  apr = gets.chomp
  if apr.empty? || apr.to_f < 0
    prompt "Please enter a positive number (eg. 6)"
  else
    break
  end
end

prompt "Enter the duration of loan in years"

duration = ''
loop do
  duration = gets.chomp
  if duration.empty? || duration.to_i < 0
    prompt "Please enter a positive number (eg. 2)"
  else
    break
  end
end

annual_rate = apr.to_f / 100
monthly_rate = annual_rate.to_f / 12
months = duration.to_i * 12
prompt "Monthly Percentage Rate: #{monthly_rate}"

monthly_payment = loan_amount.to_f *
                  ( monthly_rate /
                  (1 - (1 + monthly_rate) **- months.to_i))

prompt "Fixed Monthly Payment: $#{monthly_payment.round(2)}"
