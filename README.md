# Authority Data Solr Docker

The source to build a Docker image of A Solr 3.5, similar to the one
we use for authority data. _This isn't for production use._

It's intended to be used by developers to test [NYPL/authoritydata_updater/](https://github.com/NYPL/authoritydata_updater/) against.
**Documents posted to this solr instance will be deleted when the docker container goes down,
this is a feature, not a bug.**

## Testing that this is working

Pointing a browser to <http://localhost:8983/solr/admin/cores?action=STATUS&core=authoritydata>
will give you a response like:

```xml
<response>
  <lst name="responseHeader">
    <int name="status">0</int>
    <int name="QTime">19</int>
  </lst>
  <lst name="status">
    <lst name="authoritydata"><str name="name"/>
      <str name="instanceDir">solr/./</str>
      <str name="dataDir">solr/./data/</str>
      <date name="startTime">2019-03-21T15:42:23.17Z</date>
      <long name="uptime">442178</long>
      <lst name="index">
        <int name="numDocs">0</int>
        <int name="maxDoc">0</int>
        <long name="version">1553182943249</long>
        <int name="segmentCount">0</int>
        <bool name="current">true</bool>
        <bool name="hasDeletions">false</bool>
        <str name="directory">org.apache.lucene.store.MMapDirectory:org.apache.lucene.store.MMapDirectory@/solr/solr/data/index lockFactory=org.apache.lucene.store.NativeFSLockFactory@250f1d86</str>
        <date name="lastModified">2019-03-21T15:42:23Z</date>
      </lst>
    </lst>
  </lst>
</response>
```

This confirms that the core exists, if it didn't - the response would look like:

```xml
<response>
<lst name="responseHeader">
  <int name="status">0</int>
  <int name="QTime">0</int>
</lst>
<lst name="status"><lst name="notarealcorename"/></lst>
</response>
```
