require "minruby"

def evaluate(tree, genv, lenv)
  case tree[0]
  when 'lit'
    tree[1]
  when '+'
    evaluate(tree[1], genv, lenv) + evaluate(tree[2], genv, lenv)
  when '-'
    evaluate(tree[1], genv, lenv) - evaluate(tree[2], genv, lenv)
  when '*'
    evaluate(tree[1], genv, lenv) * evaluate(tree[2], genv, lenv)
  when '/'
    evaluate(tree[1], genv, lenv) / evaluate(tree[2], genv, lenv)
  when '%'
    evaluate(tree[1], genv, lenv) % evaluate(tree[2], genv, lenv)
  when '=='
    evaluate(tree[1], genv, lenv) == evaluate(tree[2], genv, lenv)
  when '<'
    evaluate(tree[1], genv, lenv) < evaluate(tree[2], genv, lenv)
  when '<='
    evaluate(tree[1], genv, lenv) <= evaluate(tree[2], genv, lenv)
  when '>'
    evaluate(tree[1], genv, lenv) > evaluate(tree[2], genv, lenv)
  when '>='
    evaluate(tree[1], genv, lenv) >= evaluate(tree[2], genv, lenv)
  when 'func_call'
    args = []
    i = 0
    while tree[i + 2]
      args[i] = evaluate(tree[i + 2], genv, lenv)
      i = i + 1
    end
    mhd = genv[tree[1]]
    if mhd[0] == 'builtin'
      minruby_call(mhd[1], args)
    else
    end
  when 'stmts'
    i = 1
    last = nil
    while tree[i] != nil
      last = evaluate(tree[i], genv, lenv)
      i = i + 1
    end
    last
  when 'var_assign'
    lenv[tree[1]] = evaluate(tree[2], genv, lenv)
  when 'var_ref'
    lenv[tree[1]]
  when 'if'
    if evaluate(tree[1], genv, lenv)
      evaluate(tree[2], genv, lenv)
    else
      evaluate(tree[3], genv, lenv)
    end
  when 'while'
    while evaluate(tree[1], genv, lenv)
      evaluate(tree[2], genv, lenv)
    end
  when 'while2'
    evaluate(tree[2], genv, lenv)
    while evaluate(tree[1], genv, lenv)
      evaluate(tree[2], genv, lenv)
    end
  else
    pp(tree)
  end
end

def fizz_buzz(max)
  i = 1
  while i <= max
    if i % (3 * 5) == 0
      p('FizzBuzz')
    elsif i % 5 == 0
      p('Buzz')
    elsif i % 3 == 0
      p('Fizz')
    else
      p(i)
    end
    i = i + 1
  end
end

str = minruby_load()

tree = minruby_parse(str)

genv = {
  'fizz_buzz' => ['builtin', 'fizz_buzz']
}
lenv = {}
evaluate(tree, genv, lenv)


