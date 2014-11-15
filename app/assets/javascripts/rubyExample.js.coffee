# Example of how to use RubyEngine
if true
  [evalString, output] = RubyEngine.eval("2+2")
  console.log output if output
  console.log(evalString)

  [evalString, output] = RubyEngine.eval("puts '2+3'")
  console.log output if output
  console.log(evalString)
