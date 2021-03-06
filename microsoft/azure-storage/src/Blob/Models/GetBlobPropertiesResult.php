<?php

/**
 * LICENSE: The MIT License (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * https://github.com/azure/azure-storage-php/LICENSE
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * PHP version 5
 *
 * @category  Microsoft
 * @package   MicrosoftAzure\Storage\Blob\Models
 * @author    Azure Storage PHP SDK <dmsh@microsoft.com>
 * @copyright 2016 Microsoft Corporation
 * @license   https://github.com/azure/azure-storage-php/LICENSE
 * @link      https://github.com/azure/azure-storage-php
 */
 
namespace MicrosoftAzure\Storage\Blob\Models;

use MicrosoftAzure\Storage\Common\Internal\Utilities;
use MicrosoftAzure\Storage\Common\Internal\Resources;
use MicrosoftAzure\Storage\Blob\Models\BlobProperties;

/**
 * Holds result of calling getBlobProperties
 *
 * @category  Microsoft
 * @package   MicrosoftAzure\Storage\Blob\Models
 * @author    Azure Storage PHP SDK <dmsh@microsoft.com>
 * @copyright 2016 Microsoft Corporation
 * @license   https://github.com/azure/azure-storage-php/LICENSE
 * @version   Release: 0.12.1
 * @link      https://github.com/azure/azure-storage-php
 */
class GetBlobPropertiesResult
{
    /**
     * @var BlobProperties
     */
    private $_properties;
    
    /**
     * @var array
     */
    private $_metadata;
    
    /**
     * Gets blob metadata.
     *
     * @return array
     */
    public function getMetadata()
    {
        return $this->_metadata;
    }

    /**
     * Sets blob metadata.
     *
     * @param array $metadata value.
     *
     * @return void
     */
    public function setMetadata(array $metadata)
    {
        $this->_metadata = $metadata;
    }
    
    /**
     * Gets blob properties.
     *
     * @return BlobProperties
     */
    public function getProperties()
    {
        return $this->_properties;
    }

    /**
     * Sets blob properties.
     *
     * @param BlobProperties $properties value.
     *
     * @return void
     */
    public function setProperties($properties)
    {
        $this->_properties = $properties;
    }

    /**
     * Create a instance using the given headers.
     *
     * @param  array  $headers response headers parsed in an array
     *
     * @return GetBlobPropertiesResult
     */
    public static function create(array $headers)
    {
        $result          = new GetBlobPropertiesResult();
        $properties      = new BlobProperties();
        $lastModified    = $headers[Resources::LAST_MODIFIED];
        $blobType        = $headers[Resources::X_MS_BLOB_TYPE];
        $contentLength   = intval($headers[Resources::CONTENT_LENGTH]);
        $leaseStatus     = Utilities::tryGetValue($headers, Resources::X_MS_LEASE_STATUS);
        $contentType     = Utilities::tryGetValue($headers, Resources::CONTENT_TYPE);
        $contentMD5      = Utilities::tryGetValue($headers, Resources::CONTENT_MD5);
        $contentEncoding = Utilities::tryGetValue($headers, Resources::CONTENT_ENCODING);
        $contentLanguage = Utilities::tryGetValue($headers, Resources::CONTENT_LANGUAGE);
        $cacheControl    = Utilities::tryGetValue($headers, Resources::CACHE_CONTROL);
        $etag            = $headers[Resources::ETAG];
        $metadata        = Utilities::getMetadataArray($headers);
        
        if (array_key_exists(Resources::X_MS_BLOB_SEQUENCE_NUMBER, $headers)) {
            $properties->setSequenceNumber(
                intval($headers[Resources::X_MS_BLOB_SEQUENCE_NUMBER])
            );
        }
        
        $properties->setBlobType($blobType);
        $properties->setCacheControl($cacheControl);
        $properties->setContentEncoding($contentEncoding);
        $properties->setContentLanguage($contentLanguage);
        $properties->setContentLength($contentLength);
        $properties->setContentMD5($contentMD5);
        $properties->setContentType($contentType);
        $properties->setETag($etag);
        $properties->setLastModified(Utilities::rfc1123ToDateTime($lastModified));
        $properties->setLeaseStatus($leaseStatus);
        
        $result->setProperties($properties);
        $result->setMetadata($metadata);
        
        return $result;
    }
}
