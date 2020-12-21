pub fn brackets_are_balanced(string: &str) -> bool {
    // collect as vector of chars
    let chars: Vec<_> = string.chars().collect();
    // stack for evaluation
    let mut stack = Vec::new();
    // iterate the characters
    for c in chars {
        match c {
            // if it's left, push the closer on the stack
            '(' => stack.push(')'),
            '[' => stack.push(']'),
            '{' => stack.push('}'),
            // if its right
            ')' | ']' | '}' => {
                // stack unbalanced if the wrong right
                // or if stack is empty (implicit check for None)
                if stack.pop() != Some(c) {
                    return false;
                }
            }
            // skip anything not a bracket
            _ => continue,
        }
    }
    // expression is balanced if stack is empty
    stack.is_empty()
}
