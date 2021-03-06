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
 * @package   MicrosoftAzure\Storage\Tests\Unit\Blob\Models
 * @author    Azure Storage PHP SDK <dmsh@microsoft.com>
 * @copyright 2016 Microsoft Corporation
 * @license   https://github.com/azure/azure-storage-php/LICENSE
 * @link      https://github.com/azure/azure-storage-php
 */
namespace MicrosoftAzure\Storage\Tests\unit\Blob\Models;

use MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions;
use MicrosoftAzure\Storage\Tests\Framework\TestResources;

/**
 * Unit tests for class ListBlobsOptions
 *
 * @category  Microsoft
 * @package   MicrosoftAzure\Storage\Tests\Unit\Blob\Models
 * @author    Azure Storage PHP SDK <dmsh@microsoft.com>
 * @copyright 2016 Microsoft Corporation
 * @license   https://github.com/azure/azure-storage-php/LICENSE
 * @version   Release: 0.12.1
 * @link      https://github.com/azure/azure-storage-php
 */
class ListBlobsOptionsTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::setPrefix
     */
    public function testSetPrefix()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = 'myprefix';
        
        // Test
        $options->setPrefix($expected);
        
        // Assert
        $this->assertEquals($expected, $options->getPrefix());
    }
    
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::getPrefix
     */
    public function testGetPrefix()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = 'myprefix';
        $options->setPrefix($expected);
        
        // Test
        $actual = $options->getPrefix();
        
        // Assert
        $this->assertEquals($expected, $actual);
    }
    
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::setDelimiter
     */
    public function testSetDelimiter()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = 'mydelimiter';
        
        // Test
        $options->setDelimiter($expected);
        
        // Assert
        $this->assertEquals($expected, $options->getDelimiter());
    }
    
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::getDelimiter
     */
    public function testGetDelimiter()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = 'mydelimiter';
        $options->setDelimiter($expected);
        
        // Test
        $actual = $options->getDelimiter();
        
        // Assert
        $this->assertEquals($expected, $actual);
    }
    
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::setMarker
     */
    public function testSetMarker()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = 'mymarker';
        
        // Test
        $options->setMarker($expected);
        
        // Assert
        $this->assertEquals($expected, $options->getMarker());
    }
    
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::getMarker
     */
    public function testGetMarker()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = 'mymarker';
        $options->setMarker($expected);
        
        // Test
        $actual = $options->getMarker();
        
        // Assert
        $this->assertEquals($expected, $actual);
    }
    
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::setMaxResults
     */
    public function testSetMaxResults()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = 3;
        
        // Test
        $options->setMaxResults($expected);
        
        // Assert
        $this->assertEquals($expected, $options->getMaxResults());
    }
    
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::getMaxResults
     */
    public function testGetMaxResults()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = 3;
        $options->setMaxResults($expected);
        
        // Test
        $actual = $options->getMaxResults();
        
        // Assert
        $this->assertEquals($expected, $actual);
    }
    
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::setIncludeMetadata
     */
    public function testSetIncludeMetadata()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = true;
        
        // Test
        $options->setIncludeMetadata($expected);
        
        // Assert
        $this->assertEquals($expected, $options->getIncludeMetadata());
    }
    
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::getIncludeMetadata
     */
    public function testGetIncludeMetadata()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = true;
        $options->setIncludeMetadata($expected);
        
        // Test
        $actual = $options->getIncludeMetadata();
        
        // Assert
        $this->assertEquals($expected, $actual);
    }
    
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::setIncludeSnapshots
     */
    public function testSetIncludeSnapshots()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = true;
        
        // Test
        $options->setIncludeSnapshots($expected);
        
        // Assert
        $this->assertEquals($expected, $options->getIncludeSnapshots());
    }
    
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::getIncludeSnapshots
     */
    public function testGetIncludeSnapshots()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = true;
        $options->setIncludeSnapshots($expected);
        
        // Test
        $actual = $options->getIncludeSnapshots();
        
        // Assert
        $this->assertEquals($expected, $actual);
    }
    
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::setIncludeUncommittedBlobs
     */
    public function testSetIncludeUncommittedBlobs()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = true;
        
        // Test
        $options->setIncludeUncommittedBlobs($expected);
        
        // Assert
        $this->assertEquals($expected, $options->getIncludeUncommittedBlobs());
    }
    
    /**
     * @covers MicrosoftAzure\Storage\Blob\Models\ListBlobsOptions::getIncludeUncommittedBlobs
     */
    public function testGetIncludeUncommittedBlobs()
    {
        // Setup
        $options = new ListBlobsOptions();
        $expected = true;
        $options->setIncludeUncommittedBlobs($expected);
        
        // Test
        $actual = $options->getIncludeUncommittedBlobs();
        
        // Assert
        $this->assertEquals($expected, $actual);
    }
}
