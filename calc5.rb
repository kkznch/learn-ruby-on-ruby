answer = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
guess = gets.to_i
if guess == answer
  p('あたり！')
else
  p('はずれ！')
end
