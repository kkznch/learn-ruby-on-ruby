numbers = 1..100
for n in numbers do
  if n % (3 * 5) == 0
    p('FizzBuzz')
  elsif n % 5 == 0
    p('Buzz')
  elsif n % 3 == 0
    p('Fizz')
  else
    p(n)
  end
end
