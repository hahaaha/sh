import { program } from "commander"
import chalk from 'chalk'
import  enquirer from 'enquirer'
import { simpleGit } from "simple-git"

const { prompt }  = enquirer

program
    .option('--first')
    .option('-s, --separator <char>')

program.command('publish')
    .description('publish package')
    .action(async () => {
        const log = console.log;
        const git = simpleGit()
        log(chalk.blue('start publish'))
        const response: {question: boolean} = await prompt({
            type: 'confirm',
            name: 'question',
            message: 'do you need password'
        })
        if(response.question)  {
            console.log('log password')
        }
        // await git.pull()
        // await git.push()
        const branch_name = await git.raw(['symbolic-ref', '--short', 'HEAD'])
        console.log(chalk.green('current branch:', branch_name))
    })

program.parse()