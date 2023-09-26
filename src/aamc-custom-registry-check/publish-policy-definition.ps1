New-AzPolicyDefinition `
    -Name 'registry_assertion_policy' `
    -Policy '.\output\RegistryAssertion_AuditIfNotExists.json'