# coding: utf-8

require "minruby"

def max(tree)
  case tree[0]
  when 'lit'
    tree[1]
  else
    left = max(tree[1])
    right = max(tree[2])
    left > right ? left : right
  end
end

str = gets

tree = minruby_parse(str)

answer = max(tree)

pp(answer)


