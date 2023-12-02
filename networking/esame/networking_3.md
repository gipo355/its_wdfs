# Networking 3

<!--toc:start-->

- [Networking 3](#networking-3)
  - [scheda di rete (NIC network interface card)](#scheda-di-rete-nic-network-interface-card)
  - [repeater, bridge e hub](#repeater-bridge-e-hub)
  - [switch](#switch)
  - [managed and unmanaged switch](#managed-and-unmanaged-switch)
  - [access point wireless](#access-point-wireless)
  - [Router](#router)
  - [firewall](#firewall)
  - [ids e ips](#ids-e-ips)
  - [UTM](#utm)
  - [sistemi legacy e embedded](#sistemi-legacy-e-embedded)
  - [patch panel](#patch-panel)
  - [POE power over ethernet](#poe-power-over-ethernet)
  - [EOP ethernet over power](#eop-ethernet-over-power)
  <!--toc:end-->

## scheda di rete (NIC network interface card)

## repeater, bridge e hub

usati all'inizio

l'hub non e' sicuro

obsoleti

## switch

inseriscono i mac address nella tabella di routing

inoltrano i pacchetti solo al destinatario

## managed and unmanaged switch

managed Switch: configurabili e monitorabili, vlan possibile

unmanaged Switch: non configurabili e monitorabili. meno costi e piu facili.

## access point wireless

forniscono accesso di rete ai dispositivi wireless

## Router

connettono due o piu' reti

## firewall

un router integrato in genere contiene firewall + switch + router + access point

firewall utilizzano tecniche per autorizzare o bloccare il traffico.

access control list (ACL) per bloccare o autorizzare il traffico

## ids e ips

ids intrusion detection system

ips intrusion prevention system

## UTM

unified threat management: firewall + ids + ips

indica appliance che forniscono piu' servizi di sicurezza ( sicurezza completa )

stateful firewall: controlla lo stato della connessione

oltre a IPS+IDS+Stateful firewall, UTM puo' includere:

- protezione zero day
- antivirus
- antispam
- filtro contenuti email
- filtro proxy
- NAC network access control
- VPN
- anti ddos

## sistemi legacy e embedded

legacy: sistemi obsoleti ma ancora utilizzati

embedded: sistemi integrati in dispositivi

## patch panel

punto di raccolta per cavi di rete

alimentato o non alimentato: se alimentato puo rigenerare il segnale

## POE power over ethernet

alimentazione elettrica attraverso cavo ethernet

## EOP ethernet over power

trasmissione dati attraverso cavo elettrico
