---
name: bash-env
description: Active direnv et mise avant d'exécuter une commande via l'outil Bash sur cette machine (CR7H3M3). À utiliser pour toute commande nécessitant les variables définies par un .envrc ou les versions d'outils gérées par mise.
---

# Environnement bash (CR7H3M3)

L'outil Bash lance un shell non interactif : les hooks direnv et mise
ne sont pas chargés. Pour appliquer les variables du `.envrc` du
répertoire courant et activer mise, fais précéder chaque commande
par :

```bash
eval "$(direnv export bash)" 2>/dev/null; eval "$(mise activate bash)" 2>/dev/null; <ta commande>
```

Si la commande doit s'exécuter dans un sous-dossier ayant son propre
`.envrc`/`.mise.toml`, fais le `cd` avant le `eval` pour que direnv et
mise résolvent le bon contexte.
