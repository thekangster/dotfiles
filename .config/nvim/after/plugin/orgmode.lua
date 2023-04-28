require('orgmode').setup_ts_grammar()
require('orgmode').setup({
    org_agenda_files = {'~/org/*', '~/my-orgs/**/*'},
    org_default_notes_file = '~/org/refile.org',
})
