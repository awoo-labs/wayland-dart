#!/usr/bin/env python3

import requests
import yaml
import urllib.parse

API_BASE = "https://gitlab.freedesktop.org/api/v4/projects/"
REPOS = [
    {
        "section": "",
        "project": "wayland/wayland",
        "path": "protocol",
        "base_url": "https://gitlab.freedesktop.org/wayland/wayland/-/raw/main/protocol"
    },
    {
        "section": "stable",
        "project": "wayland/wayland-protocols",
        "path": "stable",
        "base_url": "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/raw/main/stable"
    },
    {
        "section": "staging",
        "project": "wayland/wayland-protocols",
        "path": "staging",
        "base_url": "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/raw/main/staging"
    },
    {
        "section": "unstable",
        "project": "wayland/wayland-protocols",
        "path": "unstable",
        "base_url": "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/raw/main/unstable"
    },
]

def list_tree(project, tree_path):
    proj_id = urllib.parse.quote(project, safe='')
    url = f"{API_BASE}{proj_id}/repository/tree"
    resp = requests.get(url, params={"path": tree_path, "per_page": 100})
    resp.raise_for_status()
    return resp.json()

protocols = []
for repo in REPOS:
    base = repo['base_url']
    section = repo['section']
    items = list_tree(repo['project'], repo['path'])
    for item in items:
        if section == '' and item['type'] == 'blob' and item['name'].endswith('.xml'):
            protocols.append({
                'name': item['name'],
                'input': f"{base}/{item['name']}",
                'output': item['name'].replace('.xml', '.dart')
            })
        elif section != '' and item['type'] == 'tree':
            sub = item['name']
            sub_items = list_tree(repo['project'], f"{repo['path']}/{sub}")
            for f in sub_items:
                if f['type'] == 'blob' and f['name'].endswith('.xml'):
                    protocols.append({
                        'name': f['name'],
                        'input': f"{base}/{sub}/{f['name']}",
                        'output': f"{section}/{sub}/{f['name'].replace('.xml', '.dart')}"
                    })

print(yaml.dump({'protocols': protocols}, sort_keys=False))
