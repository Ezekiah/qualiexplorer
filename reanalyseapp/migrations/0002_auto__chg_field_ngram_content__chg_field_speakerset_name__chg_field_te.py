# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Changing field 'Ngram.content'
        db.alter_column('reanalyseapp_ngram', 'content', self.gf('django.db.models.fields.CharField')(max_length=255))

        # Changing field 'SpeakerSet.name'
        db.alter_column('reanalyseapp_speakerset', 'name', self.gf('django.db.models.fields.CharField')(max_length=255))

        # Changing field 'Texte.status'
        db.alter_column('reanalyseapp_texte', 'status', self.gf('django.db.models.fields.CharField')(max_length=20))

        # Changing field 'Texte.locationgeo'
        db.alter_column('reanalyseapp_texte', 'locationgeo', self.gf('django.db.models.fields.CharField')(max_length=255, null=True))

        # Changing field 'Texte.name'
        db.alter_column('reanalyseapp_texte', 'name', self.gf('django.db.models.fields.CharField')(max_length=255))

        # Changing field 'Texte.location'
        db.alter_column('reanalyseapp_texte', 'location', self.gf('django.db.models.fields.CharField')(max_length=255))

        # Changing field 'Texte.doccat2'
        db.alter_column('reanalyseapp_texte', 'doccat2', self.gf('django.db.models.fields.CharField')(max_length=255))

        # Changing field 'Code.name'
        db.alter_column('reanalyseapp_code', 'name', self.gf('django.db.models.fields.CharField')(max_length=255))

        # Changing field 'WordEntity.content'
        db.alter_column('reanalyseapp_wordentity', 'content', self.gf('django.db.models.fields.CharField')(max_length=255))

        # Changing field 'Speaker.ddi_id'
        db.alter_column('reanalyseapp_speaker', 'ddi_id', self.gf('django.db.models.fields.CharField')(max_length=255))

        # Changing field 'Speaker.name'
        db.alter_column('reanalyseapp_speaker', 'name', self.gf('django.db.models.fields.CharField')(max_length=255))

        # Changing field 'Speaker.color'
        db.alter_column('reanalyseapp_speaker', 'color', self.gf('django.db.models.fields.CharField')(max_length=255))

        # Changing field 'Speaker.ddi_type'
        db.alter_column('reanalyseapp_speaker', 'ddi_type', self.gf('django.db.models.fields.CharField')(max_length=255))

        # Changing field 'AttributeType.name'
        db.alter_column('reanalyseapp_attributetype', 'name', self.gf('django.db.models.fields.CharField')(max_length=255))

        # Changing field 'AttributeType.publicy'
        db.alter_column('reanalyseapp_attributetype', 'publicy', self.gf('django.db.models.fields.CharField')(max_length=255))

    def backwards(self, orm):

        # Changing field 'Ngram.content'
        db.alter_column('reanalyseapp_ngram', 'content', self.gf('django.db.models.fields.CharField')(max_length=100))

        # Changing field 'SpeakerSet.name'
        db.alter_column('reanalyseapp_speakerset', 'name', self.gf('django.db.models.fields.CharField')(max_length=50))

        # Changing field 'Texte.status'
        db.alter_column('reanalyseapp_texte', 'status', self.gf('django.db.models.fields.CharField')(max_length=2))

        # Changing field 'Texte.locationgeo'
        db.alter_column('reanalyseapp_texte', 'locationgeo', self.gf('django.db.models.fields.CharField')(max_length=32, null=True))

        # Changing field 'Texte.name'
        db.alter_column('reanalyseapp_texte', 'name', self.gf('django.db.models.fields.CharField')(max_length=100))

        # Changing field 'Texte.location'
        db.alter_column('reanalyseapp_texte', 'location', self.gf('django.db.models.fields.CharField')(max_length=30))

        # Changing field 'Texte.doccat2'
        db.alter_column('reanalyseapp_texte', 'doccat2', self.gf('django.db.models.fields.CharField')(max_length=25))

        # Changing field 'Code.name'
        db.alter_column('reanalyseapp_code', 'name', self.gf('django.db.models.fields.CharField')(max_length=50))

        # Changing field 'WordEntity.content'
        db.alter_column('reanalyseapp_wordentity', 'content', self.gf('django.db.models.fields.CharField')(max_length=50))

        # Changing field 'Speaker.ddi_id'
        db.alter_column('reanalyseapp_speaker', 'ddi_id', self.gf('django.db.models.fields.CharField')(max_length=170))

        # Changing field 'Speaker.name'
        db.alter_column('reanalyseapp_speaker', 'name', self.gf('django.db.models.fields.CharField')(max_length=70))

        # Changing field 'Speaker.color'
        db.alter_column('reanalyseapp_speaker', 'color', self.gf('django.db.models.fields.CharField')(max_length=7))

        # Changing field 'Speaker.ddi_type'
        db.alter_column('reanalyseapp_speaker', 'ddi_type', self.gf('django.db.models.fields.CharField')(max_length=3))

        # Changing field 'AttributeType.name'
        db.alter_column('reanalyseapp_attributetype', 'name', self.gf('django.db.models.fields.CharField')(max_length=200))

        # Changing field 'AttributeType.publicy'
        db.alter_column('reanalyseapp_attributetype', 'publicy', self.gf('django.db.models.fields.CharField')(max_length=1))

    models = {
        'reanalyseapp.attribute': {
            'Meta': {'object_name': 'Attribute'},
            'attributetype': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.AttributeType']"}),
            'enquete': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Enquete']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.TextField', [], {})
        },
        'reanalyseapp.attributetype': {
            'Meta': {'object_name': 'AttributeType'},
            'enquete': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Enquete']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'publicy': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'reanalyseapp.code': {
            'Meta': {'object_name': 'Code'},
            'enquete': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Enquete']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'textes': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['reanalyseapp.Texte']", 'symmetrical': 'False'})
        },
        'reanalyseapp.enquete': {
            'Meta': {'object_name': 'Enquete'},
            'date': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'ddi_id': ('django.db.models.fields.CharField', [], {'max_length': '170'}),
            'ese': ('django.db.models.fields.TextField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'locationpath': ('django.db.models.fields.CharField', [], {'max_length': '250'}),
            'metadata': ('django.db.models.fields.TextField', [], {'default': "'{}'"}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '250'}),
            'status': ('django.db.models.fields.CharField', [], {'max_length': '2'}),
            'statuscomplete': ('django.db.models.fields.BigIntegerField', [], {'default': '0'}),
            'uploadpath': ('django.db.models.fields.CharField', [], {'max_length': '250'})
        },
        'reanalyseapp.ngram': {
            'Meta': {'object_name': 'Ngram'},
            'content': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'df': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'enquete': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Enquete']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        'reanalyseapp.ngramspeaker': {
            'Meta': {'object_name': 'NgramSpeaker'},
            'enquete': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Enquete']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'ngram': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Ngram']"}),
            'speaker': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Speaker']"}),
            'tf': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'tfidf': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'tn': ('django.db.models.fields.BigIntegerField', [], {'default': '0'})
        },
        'reanalyseapp.sentence': {
            'Meta': {'object_name': 'Sentence'},
            'code': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Code']"}),
            'contenthtml': ('django.db.models.fields.TextField', [], {}),
            'contenttxt': ('django.db.models.fields.TextField', [], {}),
            'enquete': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Enquete']"}),
            'i': ('django.db.models.fields.BigIntegerField', [], {'default': '0'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'n': ('django.db.models.fields.BigIntegerField', [], {'default': '0'}),
            'o': ('django.db.models.fields.BigIntegerField', [], {'default': '0'}),
            'speaker': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Speaker']"}),
            'texte': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Texte']"})
        },
        'reanalyseapp.sitecontent': {
            'Meta': {'object_name': 'SiteContent'},
            'contenthtml': ('django.db.models.fields.TextField', [], {}),
            'description': ('django.db.models.fields.CharField', [], {'max_length': '400'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lang': ('django.db.models.fields.CharField', [], {'max_length': '2'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'reanalyseapp.speaker': {
            'Meta': {'object_name': 'Speaker'},
            'attributes': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['reanalyseapp.Attribute']", 'symmetrical': 'False'}),
            'color': ('django.db.models.fields.CharField', [], {'default': "'#FADFCA'", 'max_length': '255'}),
            'contenttxt': ('django.db.models.fields.TextField', [], {}),
            'ddi_id': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'ddi_type': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'enquete': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Enquete']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'public': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'textes': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['reanalyseapp.Texte']", 'symmetrical': 'False'})
        },
        'reanalyseapp.speakerset': {
            'Meta': {'object_name': 'SpeakerSet'},
            'description': ('django.db.models.fields.TextField', [], {}),
            'enquete': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Enquete']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'speakers': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['reanalyseapp.Speaker']", 'symmetrical': 'False'})
        },
        'reanalyseapp.tag': {
            'Meta': {'ordering': "['type', 'slug']", 'unique_together': "(('type', 'slug'),)", 'object_name': 'Tag'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '128'}),
            'type': ('django.db.models.fields.CharField', [], {'max_length': '2'})
        },
        'reanalyseapp.texte': {
            'Meta': {'object_name': 'Texte'},
            'contenthtml': ('django.db.models.fields.TextField', [], {'default': "''", 'blank': 'True'}),
            'contenttxt': ('django.db.models.fields.TextField', [], {'default': "''", 'blank': 'True'}),
            'contentxml': ('django.db.models.fields.TextField', [], {'default': "''", 'blank': 'True'}),
            'date': ('django.db.models.fields.DateField', [], {'default': 'datetime.datetime(2014, 4, 10, 0, 0)'}),
            'description': ('django.db.models.fields.TextField', [], {'default': "''", 'blank': 'True'}),
            'doccat1': ('django.db.models.fields.CharField', [], {'max_length': '25'}),
            'doccat2': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'doctype': ('django.db.models.fields.CharField', [], {'max_length': '4'}),
            'enquete': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Enquete']"}),
            'filesize': ('django.db.models.fields.BigIntegerField', [], {'default': '0'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'location': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'locationgeo': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'}),
            'locationpath': ('django.db.models.fields.CharField', [], {'max_length': '500'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'public': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'status': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'statuscomplete': ('django.db.models.fields.BigIntegerField', [], {'default': '0'}),
            'tags': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['reanalyseapp.Tag']", 'symmetrical': 'False'})
        },
        'reanalyseapp.visualization': {
            'Meta': {'object_name': 'Visualization'},
            'contenthtml': ('django.db.models.fields.TextField', [], {}),
            'date': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'enquete': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Enquete']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'json': ('django.db.models.fields.TextField', [], {}),
            'locationpath': ('django.db.models.fields.CharField', [], {'max_length': '250'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'public': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'speakers': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['reanalyseapp.Speaker']", 'symmetrical': 'False'}),
            'status': ('django.db.models.fields.CharField', [], {'max_length': '2'}),
            'textes': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['reanalyseapp.Texte']", 'symmetrical': 'False'}),
            'viztype': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'reanalyseapp.word': {
            'Meta': {'object_name': 'Word'},
            'enquete': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Enquete']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'n': ('django.db.models.fields.BigIntegerField', [], {'default': '0'}),
            'sentence': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Sentence']"}),
            'speaker': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Speaker']"}),
            'wordentityspeaker': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.WordEntitySpeaker']"})
        },
        'reanalyseapp.wordentity': {
            'Meta': {'object_name': 'WordEntity'},
            'code': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Code']"}),
            'content': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'description': ('django.db.models.fields.TextField', [], {'max_length': '400'}),
            'df': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'enquete': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Enquete']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'maxspeakerid': ('django.db.models.fields.BigIntegerField', [], {'default': '0'}),
            'maxtfidf': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'textes': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['reanalyseapp.Texte']", 'symmetrical': 'False'})
        },
        'reanalyseapp.wordentityspeaker': {
            'Meta': {'object_name': 'WordEntitySpeaker'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'speaker': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.Speaker']"}),
            'textes': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['reanalyseapp.Texte']", 'symmetrical': 'False'}),
            'tf': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'tfidf': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'wordentity': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['reanalyseapp.WordEntity']"})
        }
    }

    complete_apps = ['reanalyseapp']