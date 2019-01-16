
describe 'psake GitHub Action' {
    context 'Validation' {
        it 'Has a valid workflow file' {
            act -l
            $LASTEXITCODE | should -be 0
        }
    }

    context 'Actions' {
        it 'Runs [Succeed] psake task correctly' {
            act --action psake-succeed
            $LASTEXITCODE | should -be 0
        }
        it 'Runs [Fail] psake task correctly' {
            act --action psake-fail
            $LASTEXITCODE | should -be 1
        }
    }
}