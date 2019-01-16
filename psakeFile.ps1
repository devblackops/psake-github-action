task default -depends Succeed

task Succeed {
    'I succeeded'
}

task Fail {
    throw 'Oops, I did it again...'
}
