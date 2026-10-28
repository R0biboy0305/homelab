.PHONY: up down restart logs ps reset

DC= docker compose -f docker-compose.yaml
s ?=

up:
	$(DC) up -d $(s)

down:
	$(DC) down $(s)

restart: down up

logs:
	$(DC) logs -f $(s)

ps:
	$(DC) ps $(s)

reset:
	@read -p "Supprimer la configuration de $(or $(s),TOUS les services) ? [y/N] " ans; case "$$ans" in [yY]) ;; *) echo "Annulé."; exit 1 ;; esac
	$(DC) down $(s)
	rm -rf ./config/$(or $(s),*)
