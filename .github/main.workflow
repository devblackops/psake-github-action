workflow "Test" {
    on = "push"
    resolves = ["psake-succeed"]
}

action "psake-succeed" {
    uses = "devblackops/psake-github-action@master"
    args = ["Succeed"]
}

action "psake-fail" {
    uses = "devblackops/psake-github-action@master"
    args = ["Fail"]
}
