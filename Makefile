# expected make version >= 3.82

.ONESHELL:

CARGO_TARGET_DIR =$(shell pwd)
WEB_DIR =$(shell pwd)/web
POSTS_DIR =$(shell pwd)/contracts/posts
LOCUTUS_DIR=$(shell cd locutus && pwd)

run-prep:
	rm -rf /tmp/locutus
	
build-p2p:
	cd $(LOCUTUS_DIR)/crates/locutus-core/examples
	cargo build

build-tool:
	cd $(LOCUTUS_DIR)/crates/locutus-node
	cargo build

webapp-archive:
	

webapp-contract:
	cd $(WEB_DIR)
	CARGO_TARGET_DIR="${CARGO_TARGET_DIR}" ldt build

posts:
	cd $(POSTS_DIR)
	CARGO_TARGET_DIR="${CARGO_TARGET_DIR}" ldt build

build: build-tool posts webapp

run: run-prep build

	locutus/target/debug/ldt publish --code build/locutus/poc_proposal_assessment.wasm --state build/locutus/contract-state
	locutus/target/debug/ldt publish --code build/locutus/poc_proposal_assessment_posts.wasm --state build/locutus/contract-state

	locutus-node local 
