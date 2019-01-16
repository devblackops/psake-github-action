workflow "Test" {
    on = "push"
    resolves = ["psake-succeed"]
}

action "psake-succeed" {
    uses = "."
    args = ["Succeed"]
}

action "psake-fail" {
    uses = "."
    args = ["Fail"]
}
