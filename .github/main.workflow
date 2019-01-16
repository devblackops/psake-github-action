workflow "Test" {
    on = "push"
    resolves = ["psake-succeed"]
}

action "psake-succeed" {
    uses = "devblackops/psake-github-actions@master"
    args = ["Succeed"]
}

action "psake-fail" {
    uses = "devblackops/psake-github-actions@master"
    args = ["Fail"]
}
